class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260407-015732"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e7c3026ef544b5cfdcad2bfcc5ffb5decb63fdb8da97f2421e0c6502663fa14b"
    sha256 cellar: :any_skip_relocation, sequoia:      "0dadf095222612c64b58359985b464aca44b0a6befc1fbf5d2c55c407cd370fc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "436219937facc79c81c4dc1d3792295ccd81f4d4ce7596f5aa65206d4436a12b"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2cf579826b564ac76fe54975c402b34d75e1583bcd04f14fcad675e780bff917" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b62693498904c03ecc72beaf97eb1f0e5c6a26ee7e7e7c7b82d586ed8a7158be" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4c30afe5ff1f1945db556b23418d8a4526e3a636496884e2979b39fe11bdfc32" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.16.0-dev.3132+fd2718f82.tar.xz"
  version "0.16.0-dev.3132+fd2718f82"
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
