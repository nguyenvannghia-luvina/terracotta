1. 目的：
	前に簡単なGroovyProjectで、TerraCottaを使えました。
	ですから、OSGIシステムにTerraCottaが使えるかどうか確認するために、Maven　Projectとして、TerraCottaを使ってみます。
2. 前提条件：
	TerraCottaを使えるために、TerraCotta　Libraryが必要です。
		TerraCotta　サーバ
	TerraCottaOpenソースから取得できます。以下のLinkを参照してください：
		https://github.com/wiperdog/experimental/tree/master/terracotta
	３つもの（quartz 、ehcache、terracotta）をBuiltした後、
		Local RepositoryからTerraCottaの必要なLibraryを取得できます。
			(pomファイルに設定されるものです)
3. ソースコードとBuilt：
	ソースコードは以下のものを含みます：
		/pom.xml：(TerraCottaの必要なLibraryを設定します)
		/src/demoTerracottaBundle: ３つファイルがあります。その中に
			AJob.groovy: Quartz Job　を　Implementするクラス
			TerracottaConnect.groovy：TerraCottaを使って、Jobを作成して、実行します。
	Built：
		/src/demoTerracottaBundle/TerracottaConnect.groovyファイルにTerraCottaサーバの情報を使って、
			org.quartz.jobStore.tcConfigUrlを設定した後、MavenコマンドでInstallします: mvn clean install
		BuiltされたBundleはdemoTerracottaOSGIに使われます。demoTerracottaOSGIのREADMEファイルを参照してください。