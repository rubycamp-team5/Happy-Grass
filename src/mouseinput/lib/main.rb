# 基本となるdxrubyとchipmunkライブラリを読み込む
require 'dxruby'
require 'chipmunk'

# chipmunkをより簡潔に使えるようにするためのラッパー（本講習独自作成）を読み込む
require_relative 'lib/cp'

# ゲーム本体の進行を管轄するディレクタークラスを読み込む
require_relative 'game/director'

# ウィンドウのサイズを設定
Window.width = 800
Window.height = 600

# ディレクタークラスのインスタンス（オブジェクト）を生成
director = Director.new

# ゲームウィンドウを生成し、メインループを開始する
# 本メソッド（Window.loop）は、プログラム中に1個までとする）
Window.loop do
  # ESCキー押下にてゲームを終了（メインループを抜ける）
  break if Input.key_push?(K_ESCAPE)

  # ディレクターに対して、1フレーム分ゲームを進行するよう命じる
  director.play
end
