//開始のメッセージ　「画像の入っているフォルダを開きましょう」
showMessage("Select Image Folder");

//open image folder
openDir = getDirectory("Choose a Directory"); //画像ファイルの保存されているフォルダを指定する
list = getFileList(openDir); //フォルダ内の画像ファイルの情報を取得する
//Array.show(list) //message for debug．デバグ用のコマンド

run("Clear Results"); //結果ウィンドウから残っている結果を一度消去する

//get number of images in the folder
a = list.length //繰り返し計算のため画像ファイルの数を数える
//print(a) //message for debug．デバグ用のコマンド

//measure area of oocytes
for (i=0; i<a; i++){
	open(openDir+list[i]); //open file one-by-one．ファイルをリストの順にしたがってひとつづつ開く
	setOption("ScaleConversions", true); //画像変換時のスケール変化に対応（おそらく今回のオーサイトの画像変換では必要ない）
    run("8-bit"); //convert image from RBG or 16-bit to 8-bit. Metaview saves 16-bit image．メタビューが保存する画像は16-bitなので，8-bitに変換
    setOption("BlackBackground", false); //white background and black object．//二値化のまえに，背景が黒でなく白であることを指定
    run("Convert to Mask"); //make binary image．二値化
    run("Set Measurements...", "area display redirect=None decimal=4"); //測定項目を面積として，ファイル名も記録するように指定 
    run("Analyze Particles...", "size=100-Infinity circularity=0.20-1.00 display add"); //面積を測定．ただし大きさが100ピクセル未満（ノイズを除去），短径と長径の比が1:5以下の画像（多分オーサイトではない）は測定しない
	close(); //測定した画像を閉じる
} //次の画像に戻る

close("ROI Manager"); //ROI Managerというウィンドウが勝手に開くので，これを最後に閉じる．デバグのときは閉じない
close("list"); //フォルダ内の画像ファイルの情報ウィンドウの表示を閉じる．デバグのときは閉じない
//saveAs("Results", openDir + "Oocyte area results.csv"); //自動で結果保存する際に利用．現在は手動で結果保存．