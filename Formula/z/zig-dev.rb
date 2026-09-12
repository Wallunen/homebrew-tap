class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260912-024523"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4c83538e8084ea03052b1e40b1c03c0c8e58301200ad9760266b8d4db7529906"
    sha256 cellar: :any_skip_relocation, sequoia:      "2b8ddbfbaea181ee25d25721906f8c77b4222b6a787881962e20d44606734b9a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b153ee38cd7a8dfa4c3f3b12547e57d28115e9a777659becd555ff27535e6ad7"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "eb672286dd0fd7c002da3c42f02d2642dd7f54d84fbb53d51a07f2e1241e5af1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c3723d6874fd841791d3cc69fa8c19ef61a876521e2a080a83d00841f646e4c4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0f0a3631b3246f7ee5cd7d9e42cecd608fdee1ff62ce6fbb64d2396c0375972c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2122+3e15e99e6.tar.xz"
  version "0.17.0-dev.2122+3e15e99e6"
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
