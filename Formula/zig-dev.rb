class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "aa51c8cc2732061b9a8462a605d14543f2d144264784aae76fa5a9ed7402514d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e5d81866bd6c6ab21837472c65ae98583d6cc3634ac36412da8244aa68132385" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "22a539005af68accb6ff7319ac2ae866207d55676bc075ecd07153622a7deb81" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1834+f36ac227b.tar.xz"
  version "0.12.0-dev.1834+f36ac227b"
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
