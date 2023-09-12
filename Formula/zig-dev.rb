class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7af4ac8587f162e818ea47706f82b5fa4d529513cd44fc8bceb1ae53058157aa" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e254067cdc2569861824b5ec7d2d18136c9fb77ce97dfb64a141cae7a87f191d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fc9c323b4264a427cfb91175f249f07a9ac299badb80b4ec1ebf4f9cd322067c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.306+a0968be83.tar.xz"
  version "0.12.0-dev.306+a0968be83"
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
