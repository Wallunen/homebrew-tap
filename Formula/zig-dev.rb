class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "18569ef904f66a76bf327d5d18061ec61503b396783305fe576ddea7922b6984" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "21279fbcb8c7bd79b4bd7d6400f9695672640b15b452ec41e634f38c01f8e8e3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d4b2650dd4d90b168d400ed538c7824e15fc50fadfc9aa9016a85c273d855a7e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.819+75b48ef50.tar.xz"
  version "0.12.0-dev.819+75b48ef50"
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
