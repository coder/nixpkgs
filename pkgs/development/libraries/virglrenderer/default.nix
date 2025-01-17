{ lib, stdenv, fetchurl, cmake, meson, ninja, pkg-config, python3
, libGLU, libepoxy, libX11, libdrm, mesa
}:

stdenv.mkDerivation rec {
  pname = "virglrenderer";
  version = "0.10.0";

  src = fetchurl {
    url = "https://gitlab.freedesktop.org/virgl/virglrenderer/-/archive/virglrenderer-${version}/virglrenderer-virglrenderer-${version}.tar.bz2";
    sha256 = "tMLD6lu1NnKeoQQIzwhMypKdrW5alULod2cdb8+76iM=";
  };

  buildInputs = [ libGLU libepoxy libX11 libdrm mesa ];

  nativeBuildInputs = [ cmake meson ninja pkg-config python3 ];

  dontUseCmakeConfigure = true;

  meta = with lib; {
    description = "A virtual 3D GPU library that allows a qemu guest to use the host GPU for accelerated 3D rendering";
    homepage = "https://virgil3d.github.io/";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = [ maintainers.xeji ];
  };
}
