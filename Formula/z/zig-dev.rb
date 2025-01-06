class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1f1487b519fe558622fa4fa18064f11c298dde4d4cddf5fc5fc97a8f8970a22d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ffdfb8d54620afc9a5a5e57c584abbcfcc03eff99288dc41ac6a672116ee4009" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6970fffe91ec9e189df80ffdd98c5b433800831f48a3a277bc229b382d4b5311" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2606+b039a8b61.tar.xz"
  version "0.14.0-dev.2606+b039a8b61"
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
