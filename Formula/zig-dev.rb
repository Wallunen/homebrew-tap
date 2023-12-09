class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a0dbbb0e928eec8bc1d7b7711a3d51ae3e065dbafff9c8b88e521f7a557602eb" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4523605f3e80e9b4ca712572fad27d6c3faaaa777fe7721ec7761dc0af23548d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3eca95f6f2291bef7f0907aa45a3e48ae9a2ab756b526edbc084f39e402a4152" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1807+d27002011.tar.xz"
  version "0.12.0-dev.1807+d27002011"
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
