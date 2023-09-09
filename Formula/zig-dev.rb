class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a03f15e1288875d45a8d8c966565e0204389565ed8e5b418f0b29be734c73da3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "28469c6b9a15723f152bf5c195398d1869bf0c8a619ef0c28c3e8550b6b519af" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "913e4a3fa9d593d13f25990a5e0d2d36fbc053e3da4d0d0f2e99f9ceac462a44" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.293+f33bb0228.tar.xz"
  version "0.12.0-dev.293+f33bb0228"
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
