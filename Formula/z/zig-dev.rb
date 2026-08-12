class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260812-090543"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c6d4322c780b0cb2923a3c5a2b4f60ed87de1b491bf97b3f7833e2013636671f"
    sha256 cellar: :any_skip_relocation, sequoia:      "6b57475a2d3a39a4c162162a08dba7bdd8b7077bfc441b1dd0d3a658d95ca9f9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3b71e41a2e56bfabd5812f9cbb031d76e86d5532679af600c2b20c362b98f7c9"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2b154b47ce5396c000260c06c8cf018a4bf22dd5f858fc8538e27f2012d86536" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1081a0318a97f492aaca1b76c4e6fe1ce5cd586a212ee2c0db364b05a29b5870" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e6e5c7e0834626bded90cd786d148bebf211dc80b013afefd631472b57b41f77" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1683+5ceec001b.tar.xz"
  version "0.17.0-dev.1683+5ceec001b"
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
