class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7a277d595adf85e0f0b166a94929c95467a85b2ad93b7adcbdbbca3088b31f43" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8396be2aba6f9e2fb073506a4173f0975c65ce9e00043e8d679a5e58dabc9d03" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d890e9f11c402df8242ceaa78300bbd920b82afb95f033aca3f26516c7e8c47b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3366+8e7d9afda.tar.xz"
  version "0.12.0-dev.3366+8e7d9afda"
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
