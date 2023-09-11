class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f851ddfb2b418814fc91c5fa2eeb5de347babec0b2a1558b669d5bd6bab100e6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2fed71d6110480739f255d09253f15763ae319563cce5bc84cafe93ed83e4bd7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "258272f9903c3119260a83628bd10ac082d0e40f6ae6dfa6c382c4404d6767cb" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.298+acc947191.tar.xz"
  version "0.12.0-dev.298+acc947191"
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
