# waot
R scripts and imageJ macros for the we-are-oocyte-team.
[2/8 8:21] 森 泉
Contents
## 1.  FIJI (Fiji Is Just imageJ) Macro to measure projected areas of oocytes<br>
卵母細胞の投影面積を計測するFIJI用のマクロ<br>
### FIJI macro - Installation procedure of the macro to your PC

(For non Japanese-speaking members, please use translation software to read followings)

＜ファイルについて＞
マクロファイルの名前: Oocyte_swelling_assay.ijm
 
＜このマクロでできること＞
このマクロはFIJIでもImageJでも同様に動作すると考えられていますが，FIJIでのみ動作確認しています．
FIJI / ImageJを使いますので，WindowsでもMacでも，32bitでも64bitでも最新OSでも古いバージョンでも関係なく動作します．MetaViewはWindows XPでしか動作しませんので，今後こちらに移行していってください．

（注）FIJIとImageJでは，Macroを保存するフォルダの階層が異なっているそうです．また，Macroファイルの名前の付け方のルールも異なるそうです．ここではFIJIに，このマクロを実装する手順を説明します．ImageJに実装する場合には，ImageJのMacroの使い方についてWebの情報を確認してください．
 
＜インストールの手順＞
WindowsでもMacでも方法は基本的に同じです．
FIJI.appの存在するフォルダ内に，Macroファイル（Oocyte_swelling_assay.ijm）をコピーします．

1. Macの場合：FIJI.appをダブルクリックするとFIJIアプリが立ち上がり，フォルダは開けません．ここでは「Control」を押しながらアイコンをクリックし「パッケージの内容を表示」を選びます．
Windowsの場合：Fiji.appをダブルクリックするだけでFiji.appフォルダが開きます．FIJIアプリを立ち上げるためには，さらにImageJ-win64.exe（64ビットの場合）をダブルクリックします．
 
2. 開いたフォルダの中に「Macros」という名前のフォルダがありますが，マクロファイルをコピーする場所はここではありません．
Fiji.app>plugins>Macros の中にコピーします．
Macrosフォルダが違う階層に2つあります．pluginsの中のMacrosに保存しなければいけません．ちょっとしたトラップです．
 
3. もしすでに，FIJIが立ち上がっている場合には一度再起動してください．ソフトウェアが起動する際にFIJIにマクロが読み込まれます．
 
4. FIJIを立ち上げて，プルダウンメニューのPlugins>Macrosのなかに「Oocyte swelling assay」と表示されたら成功です．メニューの下の方に表示されるかもしれません．
 
（注）FIJIのMacroの名前はアンダースコア（下線「_」）を入れる必要があるそうです．このためこのマクロの名前はOocyte_swellng_assayとなっています．ImageJではFIJIとインストール方法が異なるとどこかの記事で読みました．FIJIにマクロを読み込ませると，プルダウンメニューにはアンダースコアが消えた「Oocyte swelling assay」が表示されます．
 
## 2. R script to separate each 10 data of the outputs of the FIJI measurement of the projected areas of oocytes<br>
何列も並んだOocyteの投影面積の結果を10個づつのデータに切り分けるためだけのRスクリプト<br>
R script (split 10 data) - Installation<br>
R script (split 10 data) - How to use<br>
 
## 3. R script to calculate Pf from the projected areas of oocytes<br>
Pfを計算するRスクリプト<br>
R script (Pf calculation) - Installation<br>
R script (Pf calculation) - How to use<br>
