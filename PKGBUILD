pkgname="theom"
pkgver=4.1.0
pkgrel="1"
pkgdesc="Theom desktop environement"
arch=("x86_64")
depends=(
  'xorg-server'
  'pipewire-pulse'
  'brightnessctl'
  'picom'
  'i3-gaps'
  'polybar'
  'eww'
  'conky'
  'alacritty'
  'dunst'
  'rofi'
  'feh'
  'ttf-firacode-nerd'
  'pipewire'
  'libpipewire'
  'pipewire-alsa'
  'pipewire-pulse'
  'alsa-utils'
  'alsa-plugins'
  'upower'
  'pamixer'
  'jq'
  'gvfs'
  'gammastep'
  'python-tomli-w'
  'autotiling'
  'polkit-gnome'
  'xdg-desktop-portal-gtk'
  'glib2'
  'xorg-setxkbmap'
  'xorg-xprop'
  'xdotool'
  'xkb-switch' # need build from aur
  'xss-lock'
  'xfce4-power-manager'
  'i3lock'
  'theom-extras' # optional apps
  'theom-utils' # custom theom apps
)

url="https://github.com/AxOS-project/theom"
license=('GPL')

optdepends=(
  'plattenalbum: A GUI music player for mpd'
  'i3status: Status bar for i3wm'
  'power-profiles-daemon: Power profiles support'
)

package() {
    mkdir -p "${pkgdir}/usr/"
    
    cp -r "$srcdir/bin" "$pkgdir/usr/"
    cp -r "$srcdir/share/." "$pkgdir/usr/share/"

    install -Dm644 "$srcdir/share/xsessions/theom.desktop" "$pkgdir/usr/share/xsessions/theom.desktop"

    install -Dm644 "$srcdir/share/theom/themes/fonts/feather.ttf" \
    "$pkgdir/usr/share/fonts/theom/feather.ttf"
}
