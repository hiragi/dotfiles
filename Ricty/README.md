# プログラミング用フォント Ricty

Ricty (リクティ) は Linux 環境での研究・開発に適したフリーなプログラミング用 TrueType フォントです。
Emacs や Vim を用いた C、C++、FORTRAN、Python、Perl、Ruby、AWK、sed、シェルスクリプト、LaTeX などのコーディングにおける使用を想定しています。
以下の 2 つの等幅フォントの合成、および、プログラミング用フォントとしてのいくつかのチューニングを行う生成スクリプトの配布を行なっています。

* [Inconsolata](http://levien.com/type/myfonts/inconsolata.html): 「[Top 10 Programming Fonts](http://hivelogic.com/articles/top-10-programming-fonts/)」や「[プログラミング時に最適なフォント『Inconsolata』](http://weboo-returns.com/blog/inconsolata-as-a-programming-font/)」などで高い評価を受けているサンセリフ体等幅欧文フォント
* [Migu 1M](http://mix-mplus-ipa.sourceforge.jp/): [M+ 1M](http://mplus-fonts.sourceforge.jp/) と [IPA ゴシック](http://ossipedia.ipa.go.jp/ipafont/)の合成フォント (旧称 M+1VM+IPAG circle/M+2VM+IPAG circle) であり、「[Windows でプログラミングに最適なフォントを探す](http://blog.blueblack.net/item_121)」などで高い評価を受けているゴシック体等幅和文フォント

Inconsolata 作者の Raph Levien 氏、
Migu 1M 作者の itouhiro 氏、
M+ 1M 作者の coz 氏、
IPA ゴシックのベースとされている [TB ゴシック](http://www.typebank.co.jp/fonts/gothic/tbg.html)作者の林隆男氏、
私のイニシャルから &ldquo;Ricty&rdquo; と命名しました。

# ライセンス

* Ricty が SIL Open Font License Version 1.1 section 5 に
  違反する解釈ができるとの指摘を受け、万全を期すために
  Version 3.0.0 より TrueType フォントの配布を中止し、
  生成スクリプトのみの配布とさせていただいております。
* Ricty 生成スクリプトは public domain とします。
  派生物への著作者表示を要求しません。
  ただし、使用・複製・改変・再配布は自己責任にて行うことをお願いしています。
* Ricty 生成スクリプトにより生成されたフォントは、
  [SIL Open Font License (OFL) Version 1.1](http://scripts.sil.org/ofl)、
  および、[IPA Font License Agreement v1.0](http://ipafont.ipa.go.jp/ipa_font_license_v1.html) に従うものとします。
  特に、OFL 1.1 section 5 に従い、生成されたフォントの再配布は禁止とします。

# バージョン

## Version 3.2.2 (9 June 2013)

* 全角括弧を半角括弧と差別化

## Version 3.2.1 (6 Nov. 2012)

* M+ FONTS LICENSE 記述の除去 (Migu 1M の更新に追従)
* いくつかの環境で等幅でなくなる問題に対処
* em ダッシュ処理の修正

## Version 3.2.0 (16 Apr. 2012)

* 行間の調整
* コマンドラインオプションの追加

## Version 3.1.3 (24 Nov. 2011)

* Ricty Discord のコマンドラインオプション
* コマンドラインオプションの追加

## Version 3.1.2 (3 Oct. 2011)

* Migu 20111002 に同期 (後方互換を担保せず)
* コマンドラインオプションの追加

## Version 3.1.1 (8 July 2011)

* コマンドラインオプションの追加

## Version 3.1.0 (19 June 2011)

* Mac OS X で Regular と Bold が異なる高さで表示される問題に対処

## Version 3.0.2 (2 June 2011)

* 生成スクリプトへの auto オプションの追加

## Version 3.0.1 (20 May 2011)

## Version 3.0.0 (17 May 2011)

* 生成スクリプトの配布開始
* TrueType フォントの配布中止

# 生成方法

## FontForge のインストール

### Debian/Ubuntu

    # apt-get install fontforge

### Fedora/CentOS

    # yum install fontforge

### OpenSUSE

    # zypper install fontforge

### その他の Linux

[FontForge 公式サイト](http://fontforge.sourceforge.net/ja/)より
入手してください。

## Inconsolata のインストール

[Inconsolata 公式サイト](http://levien.com/type/myfonts/inconsolata.html)より
OpenType file を入手し、インストールしてください。

## Migu 1M のインストール

「[M+ と IPA の合成フォント](http://mix-mplus-ipa.sourceforge.jp/)」より入手し、
インストールしてください (MigMix ではありません)。

## Ricty の生成

以上 2 種類のフォントをインストールした後で

    % sh ricty_generator.sh auto

もしくは、

    % sh ricty_generator.sh Inconsolata.otf migu-1m-regular.ttf migu-1m-bold.ttf

生成には 2–5 分程の時間がかかります。

## Ricty のインストール

    % cp -f Ricty*.ttf ~/.fonts/
    % fc-cache -vf

## (おまけ) `ricty_generator.sh` のコマンドラインオプション

### `-h`

ヘルプを表示する。

### `-V`

バージョン番号を表示する。

### `-f /path/to/fontforge`

fontforge コマンドのパスを指定する。

### `-v`

fontforge の警告メッセージを表示する。

### `-l`

生成の過程で生じる中間ファイルを削除せずに残す。

### `-n string`

フォントファミリ名を「Ricty」ではなく「Ricty ○○○」として生成する。

### `-w`

行間を広くする。

### `-W`

行間をかなり広くする。

### `-b`

ASCII グリフのボールド体をより太くする。

### `-B`

ASCII グリフのレギュラー/ボールド体をより太くする (レギュラーを、デフォルトのボールド体程度の太さにする)。

### `-Z unicode`

他のグリフのコピーすることで全角スペースを可視化する (たとえば `-Z 2318` とすると、全角スペースが &#x2318; になる)。

### `-z`

全角スペースを可視化しない。

### `-a`

Inconsolata のグリフを優先し、Ambiguous 文字を全角化しない。

### `-s`

Migu 1M のグリフを縮小しない (`-w` オプションとの併用を推奨)。

# 派生フォント Ricty Discord

Ricty では、調和・統一感の維持のため、プログラミング用フォントのコアである
Inconsolata 由来の ASCII 文字に手を入れないようにしています。
Discord (不協和音) 版は、統一感を乱す覚悟で ASCII 文字に手を入れた
Ricty の派生フォントです。
通常、Ricty Discord は Ricty 生成の際に自動的に生成されますが、
パッチスクリプトを直接実行することによっても生成できます。
このとき、オプションを指定することで個々の変更点を無効化することができます。

    % fontforge -script ricty_discord_patch.pe [options] Ricty-Regular.ttf Ricty-Bold.ttf

## `ricty_discord_patch.pe` のコマンドラインオプション

### `-space`

「 (半角スペース)」を可視化する。

### `-quotedbl`

「"」を拡大しない。

### `-quotesingle` または `-quote`

「'」を拡大しない。

### `-asterisk`

「\*」を少し下方に移動しない。

### `-plus`

「+」を少し下方に移動しない。

### `-comma`

「,」を拡大しない。

### `-hyphen`

「-」を少し下方に移動しない。

### `-period`

「.」を拡大しない。

### `-0` または `-zero`

「0」をドットゼロにせず、スラッシュゼロのままにする。

### `-7` または `-seven`

「7」にクロスバーを付けない。

### `-colon`

「:」を拡大しない。

### `-semicolon`

「;」を拡大しない。

### `-less-greater` または `-angles`

「<」および「>」を少し下方に移動しない。

### `-equal`

「=」を少し下方に移動しない。

### `-D`

「D」を Eth にしない (「D」にクロスバーを付けない)。

### `-Z`

「Z」にクロスバーを付けない。

### `-asciicircum` または `-circum`

「^」を拡大しない。

### `-grave`

「`」を拡大しない。

### `-l`

「l」の左下のセリフを切り落とさない。

### `-r`

「r」をセリフ体 (Inconsolata の不使用グリフ) にしない。

### `-z`

「z」にクロスバーを付けない。

### `-bar`

「|」を破断線 (Inconsolata のグリフ) にしない。

### `-asciitilde` または `-tilde`

「~」を上方に移動しない。

# 既知の問題

* Gnome-terminal において、フォントに Ricty を設定できないことがあります。
  * gconf-editor などで `~/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml` の `font` を直接編集してください。
* Mac OS X を含む一部の環境において、生成スクリプトを実行すると
  FontForge が segmentation fault で異常終了することがあります。
  * 「[Ricty のビルド中に fontforge が segmentation fault でクラッシュする問題](http://d.hatena.ne.jp/eagletmt/20110602/1306964018)」にて
    これを回避したとの報告がありました。
  * また、一部のバージョンの FontForge にはファイル名を誤認識するという
    バグがあるようです。`-v` オプションで誤認識後のファイル名を確認し、
    ファイル名を変更することで対応してください。
* 一部の環境において、生成されたフォントの全角文字の文字間隔が不自然に
  大きくなることがあります。
  * 生成されたフォントを `misc/os2version_reviser.sh` に食べさせることで
    修正できます。
* Windows ではアンチエイリアスがキレイにかからず、
  特にフォントサイズが小さいときに文字が部分的に欠けます。
  * [gdipp](http://code.google.com/p/gdipp/)、
    [ezgdi](http://code.google.com/p/ezgdi/)、
    [gdi++ Helium](http://www18.atwiki.jp/gdiplus2/pages/46.html) などを
    使用すると Linux と同等の美しさで表示されます
    (アプリケーションによってまったく機能しないことがあります)。
* 一部のフォントサイズで半角文字と全角文字の横幅比が
  1:2 にならないことがあります。
  * ピクセル値 (px) が偶数でないとき、どのフォントにおいても起こりうる問題です。
  * 一般的な 96 DPI のフォントレンダリングでは、
    9 pt、10.5 pt、12 pt、13.5 pt、15 pt など、
    1.5 の倍数を指定すると 1:2 で表示されると思います。
* 一般的なフォントと比較すると相対的にフォントサイズ (横幅) が小さくなります。
  * 横幅は和文フォントに合わせてあるので、
    一般的な Courier 互換メトリックの欧文フォントと比較すると
    83 % 程度の大きさになります。
  * また、アルファベットとのバランスをとるために日本語文字を
    91 % に縮小しています (その分文字間隔が広くなっています)。

# メモ

* `ricty_generator.sh` に Migu 1M 以外の日本語フォントを食べさせても
  大抵はうまく合成されます。
  ボールド体がない日本語フォントでも、
  ダミーを食べさせて `Ricty-Bold.ttf` を破棄すれば問題ありません。
* `ricty_discord_patch.pe` は好みで変更点を適宜無効化して
  使われることを想定して、若干過剰に作ってあります。
  私は 7, D, Z, z の 4 文字の変更を無効化しています (`-7 -D -Z -z`)。
* Cocoa Emacs でフレーム幅が意図した幅の倍になってしまうときは、
  本末転倒気味ですが、`misc/ricty_ascii_extractor.pe` で
  ASCII 文字のみを分離したフォントを生成する方法が有効です。
* `misc/ricty_greek_regenerator.pe` でアクセント付きギリシア文字を全角幅にすることができます。
  現時点ではギリシア文字拡張グリフには対応していません。

# 作者連絡先

[遊佐泰紀 (Yasunori Yusa)](http://save.sys.t.u-tokyo.ac.jp/~yusa/index.html.ja)
