self="$0"
while [ -h "$self" ]; do
	res=`ls -ld "$self"`
	ref=`expr "$res" : '.*-> \(.*\)$'`
	if expr "$ref" : '/.*' > /dev/null; then
		self="$ref"
	else
		self="`dirname \"$self\"`/$ref"
	fi
done

dir=`dirname "$self"`
CUR_DIR=`cd "$dir/" && pwd`

function installDefault
(
    echo "You did not choose any option, would you like to install with default option?[y=accept/any key=exit]"
    read uchoice
    if [ -n $uchoice  ] && [ ! $uchoice == "y" ]
    then
        usage
        exit 0
    fi 
    . ./getWiperdog.sh
    . ./installWiperdog.sh
    . ./configure.sh
    . ./configureWithJobManager.sh
    . ./runWiperdog.sh
)

function usage
(
    echo This is a reproduce wiperdog with terracotta script.
	echo startWiperdogWithTerracotta.bat [options]
	echo options : 
	echo - /gw : Get wiperdog installer from maven
	echo - /iw : Install wiperdog from the installer
	echo - /wjm : Use JobManager bundle in the wiperdog [If not, use JobManger embered in Groovy script]
	echo - /rw : Run wiperdog
	echo - /h : Open help
)

if [ $# -eq 0 ]
  then
    installDefault
	exit
fi

# Default value of variables
GET_WIPERDOG="FALSE"
INSTALL_WIPERDOG="FALSE"
WITH_JOB_MANAGER="FALSE"
RUN_WIPERDOG="FALSE"

# Get input parameters
while [ "$1" != "" ]; do
	case $1 in 
		/gw) GET_WIPERDOG="TRUE"
		;;
		/iw) INSTALL_WIPERDOG="TRUE"
		;;
		/rw) RUN_WIPERDOG="TRUE"
		;;
		/wjm) WITH_JOB_MANAGER="TRUE"
		;;
		/h | /help)	usage
				exit
		;;
		* )	usage
			exit 1
	esac
	shift
done

if [ ! -d quartz-2.2.1 ];then 
  . ./checkoutQuartz.sh
fi

cd $CUR_DIR

# GET WIPERDOG FROM MAVEN BY mvn COMMAND
if [ $GET_WIPERDOG = "TRUE" ]; then
  . ./getWiperdog.sh
fi 

# INSTALL WIPERDOG
if [ $INSTALL_WIPERDOG = "TRUE" ]; then
  . ./installWiperdog.sh
fi

# INSTALL WIPERDOG WITHOUT JOB MANAGER
if [ $WITH_JOB_MANAGER = "FALSE" ]; then
  . ./configure.sh
fi

# INSTALL WIPERDOG WITH JOB MANAGER
if [ $WITH_JOB_MANAGER = "TRUE" ]; then
  . ./configureWithJobManager.sh
fi

# START WIPERDOG
if [ $RUN_WIPERDOG = "TRUE" ]; then
. ./runWiperdog.sh
fi
