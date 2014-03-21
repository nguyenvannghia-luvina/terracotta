1. 目的：
	前に簡単なGroovyProjectで、TerraCottaを使えました。
	ですから、OSGIシステムにTerraCottaが使えるかどうか確認するために、
	TerraCottaを使って、Maven　ProjectとしてBuiltした後、OSGIシステムの中に実行してみます。
2. 前提条件：
	demoTerracottaBundleのBuiltするBundleを使いますから、まず、demoTerracottaBundleのREADMEを参照して、Builtする。
		Builtした結果（必要な設定情報を修正した後）はdemoTerracottaOSGI\lib\java\bundleに置く
	実行のために、TerraCottaサーバが必要ですから、TerraCottaOpenソースを取得できます。以下のLinkを参照して、Builtする
		https://github.com/wiperdog/experimental/tree/master/terracotta
		Builtした後、SVNからterracotta取得したFolder/deployで以下のCommandでTerracottaサーバを起動できます。
			maven exec:exec -P start-server
			(停止する時、maven exec:exec -P stop-serverを使います)
	Quartz bundleはTerraCottaの必要なLibraryとマージしなけれななりません。（demoTerracottaOSGI\lib\java\bundle\quartz-2.2.1.jar）
		マージしたものはdemoTerracottaOSGI\lib\java\bundle\quartz-new-merge.txtを参照してください。
		必要なLibraryはTerraCottaOpenソースをBuiltした後、Local repositoryから取得できます。
		（一時、必要なLibraryをExtractして、後、全部JarファイルとしてZipします）
3. 実行：
	Wiperdogの環境を簡単にして、このOSGI環境を作成しました。
	demoTerracottaOSGI\binの中に、startWiperdog.sh/startWiperdog.batを実行してください。
	実行するとき、demoTerracottaBundleのBuiltするBundleを実行できますから、OSGIシステムの中にTerraCottaを使えることが見えます。