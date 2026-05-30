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
      sha256 "3315ff00c1d90d2472c1bef7b583e3a1adb4b9160b3452aad828b077ad7dd5fa" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4f3143fa5a9723754b9516be6f9bc23fda2743abf1144570ae67ac875f5d2a09" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "19275107de7b89ec33d29b50f00997c1381c524d1e33b728472dcbd551da2e33" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.607+456b2ec07.tar.xz"
  version "0.17.0-dev.607+456b2ec07"
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
