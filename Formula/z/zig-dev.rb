class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "761636965c462fa3d5637a204860c97f815b9233c41dea4a6739826d76367b70" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1bd29e32e9ea17930218e8fc5e96b868e9229995df2bb1403267f97e42950176" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c4d19e1fe5de25c08a1fa1828c49e51c290dac03d1b504ee72994068d874f5fd" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2253+3a6a8b8aa.tar.xz"
  version "0.14.0-dev.2253+3a6a8b8aa"
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
