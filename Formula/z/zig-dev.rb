class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260529-182808"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "2f4b242179a7d702cafcdc378777ded611813863d8081ea76660afaddb080950"
    sha256 cellar: :any_skip_relocation, sequoia:      "b6fd15a33fb7854ced48f1c106fe0d6109ab0a1cec0717d4fa8fdc995186d791"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "89a37816065a0c5a4328854f03061f082ee6a14ac45663fc9412b9c1e5973f5a"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3a43e877f1a2a6e4ed7e9135da1be83334d938701b1a37ed55c8ee84a5bd29f7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7e230c59fc07b70ba50ee432481afd65f75b6386d4f74c71704d4eeca55c21c4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a4e3053460b27e879b728e0a21e2951c53036f71e15bb456097f299653909712" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.420+8086ae176.tar.xz"
  version "0.17.0-dev.420+8086ae176"
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
