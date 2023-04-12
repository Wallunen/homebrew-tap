class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3b3e15b33b71ad0573b95d529ed2dc53e75b1589c1ad747b048a7a2be0b849a5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9b8f15e2a78c0643c8d8b495af2e5a9273663fd6ec5e2f5638b438a7ec554a43" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b20de490fedd646eec5f871858e05a2aaf16bc30d9588b7a4909678abf5de8aa" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2560+602029bb2.tar.xz"
  version "0.11.0-dev.2560+602029bb2"
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
