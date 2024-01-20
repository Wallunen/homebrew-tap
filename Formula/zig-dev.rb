class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7fb07b78d8fb62d30a92d6b7464e396c72c500f73efcb7e8234571079484fbfa" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "52b7d1a8f9d33d621d451e38f5e46996c2a2270cff1d3e126c492caa47d4285e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "61f23905be6b553fc0ef29335e5f096d053aa478d2c6efad86c560936efc1c98" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2284+9b714e019.tar.xz"
  version "0.12.0-dev.2284+9b714e019"
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
