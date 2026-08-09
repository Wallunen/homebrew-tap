class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260809-011502"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "29e0d3b9665c053de6b4a4f1ae78bb17c48cc857fee4ab086b05f4fa69717142"
    sha256 cellar: :any_skip_relocation, sequoia:      "afaac6b8950e5220ee65d57165363159109fa8ddf03fcafc8960c171f281de26"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0b8b97017aaaba69fc3303e231a401214390359bc238ba2bbf233473ec940af9"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "130f847ffd8d38bf1345f6ac306f544879cba134c20e4ebc939e9ac9fbf5208b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4a23ceb99b6d5c7707db275e3092ff32659d4d6a93b5e87a44dd8514c117abcd" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b5f88806d320a2dda0b797d60e636a55256e97c1d2b644528647c56d7371737b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1640+2597da025.tar.xz"
  version "0.17.0-dev.1640+2597da025"
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
