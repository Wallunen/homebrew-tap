class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "accbe79b0ec088415421f95b9e76ea1a2a2b9e15453cbeb62e1ff9b2c0116b7d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "74d045b267ef2aedd8206e2fa5c8d543c73cabbdf922e5e1474bc868612e2773" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c9515b9af43b839645c3dc108c51ae9c48af4c5ee530ee898c8c945c91b5b8d6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.888+130227491.tar.xz"
  version "0.12.0-dev.888+130227491"
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
