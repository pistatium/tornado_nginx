# Tornado_nginx
Nginx + TornadoでWebサーバーを構築してみる

## 構成
* Nginx
 * リクエストを一旦Nginxで受ける
 * 静的だったらNginxから提供
 * Tornadoのパスならアプリケーションにリバースプロキシ
* Tornado
 * Tornado自身のサーバーはFW付属のものを使う

## 動作環境
 * Debian wheezy
   * Raspbianでのみ確認
 * Python3.2
   * インストール済
 * Nginx
   * インストール済
 * pip 
   * インストール済

## セットアップ

    sudo pip install tornado
    git clone https://github.com/pistatium/tornado_nginx.git
    sudo bash /etc/setup.sh
    sudo /etc/init.d/nginx restart
    

