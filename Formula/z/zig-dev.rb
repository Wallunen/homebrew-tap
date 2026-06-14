class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260614-032952"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4c1efae3375f953b9d48c862c535893ccb42c0daa3b3ea6417c1f6479e8d5dc7"
    sha256 cellar: :any_skip_relocation, sequoia:      "a89dc48a09ef4cdd82b6b2b00910ea060898df78b5c3a52653e3901b34904e60"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b417c3a5314a64a6ee58214b5d525303663f0d193514a8def22e4a313716f2ce"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f956e053a39c0f5dff6142d2153dca5e420bc19fc3514cbad7472e0a2cd03e25" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e04a527ba6d10879cff12105cbd4938347c31a5423a4ba4d8c907d759521168f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "54989afcf22cf8430ce9112b390ec632e594239a75c3fe626b45381748d72e23" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.857+2b2b85c5f.tar.xz"
  version "0.17.0-dev.857+2b2b85c5f"
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
