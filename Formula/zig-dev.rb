class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ac88651067749539e8706749f49f547720d252cba36f44125df9e8efb6a85f55" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "569f576a1a5fa08d99b9ab5bbc45702e4af632b38bd2163a97d056f4b23a3e35" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "eaf519b1ec3cb0f3c9bcbc47ead5f50610f9c106279a35b9feb09bed8afc628b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.141+ddf5859c2.tar.xz"
  version "0.12.0-dev.141+ddf5859c2"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"
  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
