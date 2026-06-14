class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260614-171448"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1439c9287eccc7f77c3ac7a0ec49452b5ec1775106a4a6b8238ff1ef543e9842"
    sha256 cellar: :any_skip_relocation, sequoia:      "7eb89da0f511097a2bf78148ea150bd4ba562d6bac71d3e1b60b67674608f382"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "55da32970e5e70868cdd7f5eb812a3eeb33972bd145c4dab00c1add4bc229a29"
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
