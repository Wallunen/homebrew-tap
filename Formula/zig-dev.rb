class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8f8c5d9d6889832c09d22c82a740ecf9f14e11b0369a2347cc04901ab6a73619" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b45be3042f0f1a6e2c075f964ecc3995c340dddf381e64694425eba32a5db16e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f52fbfdf0c6810c79092d91c238f7a123f7a40692cfd17ff993e3e9eeb225152" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.80+014d88ef6.tar.xz"
  version "0.12.0-dev.80+014d88ef6"
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
