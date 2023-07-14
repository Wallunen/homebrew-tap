class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5980c568573fd3ce2a4bb38d7c7657ac4407b548741fa5a00fd0dc5fda140258" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a0ef2d665b7c9ec47d74bc240b943e8a76cea6c8a84c1f76b2286ab0bf62a86c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "096c8c8cf00d78863636bb6fa442301b66529a2270a36a04e118f4da32a2f002" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3990+f2d433a19.tar.xz"
  version "0.11.0-dev.3990+f2d433a19"
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
