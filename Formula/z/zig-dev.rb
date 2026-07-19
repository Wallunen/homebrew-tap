class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260719-020900"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e6c3490542515e1165c59f5339586feab932e4e12994f1d398653592806e127c"
    sha256 cellar: :any_skip_relocation, sequoia:      "4e1c9d359012d7fe50271666e0c9cecdf2eb953dc3ea2466769472a4f6db1dfd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "66430eb36e9f923032d74e1072e5623dd098b39ffa6b9f1d57c051a3a4f84b2f"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "fc301448a1b83684094bea3ed336ce7c3a3f2c89580f088818a039ac3bf2139c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "836d56cabb48f4c9250d9ad12234d9595a644d03c82c47279925231e6ab85af0" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "029b14cd9bc84b30f7766c0ec568d214ca4ce36049749b78d9eb37bb6f4e28ce" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1422+e863bf3be.tar.xz"
  version "0.17.0-dev.1422+e863bf3be"
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
