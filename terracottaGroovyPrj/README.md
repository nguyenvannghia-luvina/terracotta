1. 目的：
	前にTerraCottaについて調査しましたが、すぐにWiperdogに適用して、結果がなかったです。
	ですから、簡単からTerraCottaが使えるかどうか確認するために、簡単なGroovyProjectとして、TerraCottaを使ってみます。
2. 前提条件：
	TerraCottaを使えるために、以下の２つものが必要です：
		TerraCotta　Library
		TerraCotta　サーバ
	TerraCottaOpenソースから取得できます。以下のLinkを参照してください：
		https://github.com/wiperdog/experimental/tree/master/terracotta
	３つもの（quartz 、ehcache、terracotta）をBuiltした後、
		Local RepositoryからTerraCottaの必要なLibraryを取得できます。
			(terracottaGroovyPrj\libに置くものです)
		SVNからterracotta取得したFolder/deployで以下のCommandでTerracottaサーバを起動できます。
			maven exec:exec -P start-server
			(停止する時、maven exec:exec -P stop-serverを使います)
3. ソースコードと実行：
	ソースコードは以下のものを含みます：
		/lib：Library jar (ほとんどTerraCottaのLibrary)
		/src: testTerracotta.groovyファイルがあります。このファイルの中にTerraCottaを使って、Jobを作成して、実行します。
	実行：
		/src/testTerracotta.groovyファイルにTerraCottaサーバの情報を使って、org.quartz.jobStore.tcConfigUrlを設定した後、
		このファイルをRun As/Groovy Scriptで実行できます。
		ProcessがTerracottaサーバが起動できたまで待ちます。