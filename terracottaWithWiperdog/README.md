1. 目的
	demoTerracottaOSGIでTerracottaはOSGIシステムの中に使えますから、
	WiperdogにTerraCottaが使えるかどうか確認するために、必要な修正をして、確認してみます。
	これはScriptを使って、TerracottaとWiperdogの実行するDemoを作成できます。
2. WiperdogとTerracottaを実行できる条件：
	Wiperdogソースを変更しなければなりません。
		Bundle:
			Terracottaを実行できるために、現在のWiperdog Bundleを修正しなければならない。
			- quartz:　必要なTerraCotta Libraryとマージする。
				そのため、修正したpomファイル（terracottaWithWiperdog\quartz\pom.xml）を使って、quartz bundleをもう一度Builtする。
			- jobmanager bundle：　ObjectJobクラスをExportするため、修正する。
		Text file/Others
			必要なファイルを変更する。
3. ソース
	現在２つ場合を対応しています：
		Jobmanagerを使う
		JobManagerを使わなくて、Jobmanagerの代わりに、Jobを実行するために、Groovyソースを作ります。
	Terracottaを実行できるために、現在のWiperdogのいくつかものを修正するのは必要です。以上の場合によって、違います。
		
	ソースは以下のものを含みます：
		1. Demoを作成するScript:　startWiperdogWithTerracotta.sh/startWiperdogWithTerracotta.bat
			このScriptの中に以下のことをやります：
			    - Mavenからwiperdog installer取得する。
			    - wiperdogをInstallする。
			　　- QuartzとJobmanager bundleをReInstallする。
				Quart：http://svn.terracotta.org/svn/quartz/tags/quartz-2.2.1/quartz/から取得して、
					修正したpomファイル（terracottaWithWiperdog\quartz\pom.xml）を使って、もう一度Builtする
				Jobmanager：https://github.com/dothihuong-luvina/org.wiperdog.jobmanagerから取得して、Builtする
			    - Jobmanagerを使うか使わないかによって、変更ものをWiperdogに上書きます（Bundleと必要なファイル）
				Jobmanagerを使う：
					ReInstallしたQuart
					新しいBuiltしたJobmanager
					terracottaWithWiperdog\terracottaWithWiperdogUseJobManagerのソース
				JobManagerを使わない：
					ReInstallしたQuart
					terracottaWithWiperdog\terracottaWithWiperdogUseJobManagerのソース
		2. Others:
			terracottaWithWiperdog\quartz：
				修正されたpomファイル、QuartzをReinstallするため
			terracottaWithWiperdog\terracottaWithWiperdogUseGroovyScript：
				JobManagerを使わなくて、Jobmanagerの代わりに、Jobを実行するためのGroovy Scriptと必要なファイル
			terracottaWithWiperdog\terracottaWithWiperdogUseJobManager：
				Jobmanagerを使う場合の変更したファイル
4．実行
	4.1. Start terracotta server:
		4.1.1 Checkout from SVN, update some pom files, built necessary libaries, follow this link:
			https://github.com/wiperdog/experimental/tree/master/terracotta
		4.1.2 Deploy:
			Go to checkouted folder of http://svn.terracotta.org/svn/tc/dso/tags/4.1.1/deploy, run command:
			mvn exec:exec -P start-server
	4.2. Checkout sources:
		https://github.com/dothihuong-luvina/terracotta.git
	4.3. In terracottaWithWiperdog folder, run file startWiperdogWithTerracotta.bat/startWiperdogWithTerracotta.sh
   		Use /h for help
   	
	*** Note: When run wiperdog with terracotta, all object which need to run job will be cached. 
          So, if you run wiperdog with jobmanager, and then, 
             you want run using groovy source, without jobmanager, you need restart terracotta server.