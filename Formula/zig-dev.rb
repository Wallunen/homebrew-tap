class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "30af701fc2308a0391ebc9c4a815a611b7c877bd1d22d7359473d2f1e762ad62" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ca7c638bd57515e92f7fca0f4e614204c34af55fcd7df8c3e038afee507fb6ba" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "95ec3fc149dd30f843aae325f22c6f157cae44f6ef34292a67c7624e57eccca3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.37+7cf3167e9.tar.xz"
  version "0.13.0-dev.37+7cf3167e9"
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
