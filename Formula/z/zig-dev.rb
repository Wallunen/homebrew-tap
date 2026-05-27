class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260526-024240"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "953eedc851e8da6c654960b99d7fe08d520090bde4aa81c7ab48e976fedfa4ef"
    sha256 cellar: :any_skip_relocation, sequoia:      "8708ea92a40804b7fce88974548d5a19192e783113014be25a1375d8b0d0038f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f930787a31756257b84b4aeb73f49547ec18eb80915f309e5e05242d25413450"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4c1173d2f6be21c26c76946ae934c5a1e0ae078d3a93eef2005cf73bfed60c3f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8a25dd0dcd57ef7050e6e07be2ad03ec777b793a7689275d6b6cfc8980f5a2a9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1915de5522c2fbea68d1b1864b230d9a25cc5d257312d960c895a8359efe9c70" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.387+31f157d80.tar.xz"
  version "0.17.0-dev.387+31f157d80"
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
