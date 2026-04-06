class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260405-083653"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "39e0160d77cef27892ae2cf1be86cd29f42b53869a3dd9fb39702bc7a278519f"
    sha256 cellar: :any_skip_relocation, sequoia:      "efe5766ffbe00f8172e038f72b96987acb33ac2018c91f32f692b7cbcee4a6d6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4b6d4419bd0fc838b671958a40256704ac656523302bb938b22089440af38e6a"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9cf32a54091cb89ab3fdda88e2394febc54cdd4e91102cfdc3fc558eb0d98c8d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ebfb3cde14ef4d04a83cc870d83bcc51940bef73d0ff3e7eb379037ef6480d88" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6f62a84f59a5c0b5e5581ddf1dc24cf922c14ff8ad9f0c30d331f4df5d3f3ec4" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.16.0-dev.3121+d34b868bc.tar.xz"
  version "0.16.0-dev.3121+d34b868bc"
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
