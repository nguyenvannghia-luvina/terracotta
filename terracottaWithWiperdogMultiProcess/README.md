1. 目的
	Wiperdogの中にTerracottaを実行できますが、１つWiperdogを使うと、あまり意味がないので、
	MultiProcessを対応するために、修正するのは必要です。
	MultiProcessの場合、Jobを実行するとき、必要があるクラスは一度TerracottaサーバにCachedされますので、MultiProcessですが、
	このクラスは数回にロードすることは必要ないです。
２．ソースコード：
	まだ自動的に実行Scriptを作成していないので、一時、変更したものをそのままPushしました：
		wiperdog_normal：		Fork（MultiProcess）を実行できるWiperdog（Terracottaを使わない）
		wiperdog_JM_Terracotta：	JobManagerを使うWiperdogはTerracottaとMultiProcessで実行できるもの。
		wiperdog_noJM_Terracotta	Jobを実行するため、JobManagerの代わりにGroovyソースを使うWiperdogはTerracottaとMultiProcessで実行できるもの。
３．実行：
	現在のWiperdog Installerを使って、Installする
	場合によって、ソースを上書きます。