class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "680d4868dfd7142f4c0f43974834230fba7af845f55d32e005cb36adb903f295" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "178e011d3d30c44cc16e264a17102fa41e4534f2ef73476faaed3374aafebc4c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f93c76f8cd70323864b4ea5c66bbfd8e5e17917efb0a653501c8692fe4aa8548" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.224+95d9292a7.tar.xz"
  version "0.14.0-dev.224+95d9292a7"
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
