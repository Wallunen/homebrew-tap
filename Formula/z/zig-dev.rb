class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260412-084042"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c70b3e12d8ed19136c2e67cbb36c8f7c11e44c4ffefb1a60988df5463f16be83"
    sha256 cellar: :any_skip_relocation, sequoia:      "fdb0f9305a596288cefb28ac57bad254ccb06c64de26d79e483d223d546cbe08"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "68fb04cc99300daaa96bf1783c4483834846c29ec5a8ceb61623d5327c0da17f"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1d886add42df5bbeab91ba9652f298ff1a81059ba2825008ab1ec841856fce61" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "17c9a3a5c06e9aa6197268bf115177962bd0bb1e51db47fda3e3624078e8ae00" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c906c866e7ad9381d112cea90c667437500904d29202d0b11ac93e1bdadc9746" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.16.0-dev.3146+0606af509.tar.xz"
  version "0.16.0-dev.3146+0606af509"
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
