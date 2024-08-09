class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "957e42bef2564241fc039ab71d8a338321e88333593a08ff1908080ac61fea88" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5f6b10b04de870f3caac0c55142cafa103a7bdabdbd173eed6205b59ed0a1810" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5ed658694525530efb3e3a7543cca754f8fa0f12bfff818eddd9dd99cd2cc7c1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.972+4381bac79.tar.xz"
  version "0.14.0-dev.972+4381bac79"
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
