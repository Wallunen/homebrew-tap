class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260709-105408"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "269239286efc1a3999b4f55e79828e89542341ba1e449ebbd3e02cdae8c2f899"
    sha256 cellar: :any_skip_relocation, sequoia:      "f4e1a7be01f817901a6155682ef4531ec068af40867c4c195d6f8185f9e54b9e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "152392b7ee985659cb418d92a24a4ab51e834ea741a1668dbff37390bc1c381c"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "769efcab993b956f91c1d8d989023f9b74c839ea219bdc08b642920f0d964d23" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8af1c24715f9402ff601b1f7b93e874bc44615700b830addc88b92b83aeb8a0d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6e57c2e2efcf6c6b20260965517ec1227cb56e34506b06759b062654a6f51c52" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1387+01b60634c.tar.xz"
  version "0.17.0-dev.1387+01b60634c"
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
