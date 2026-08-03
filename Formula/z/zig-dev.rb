class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260802-165303"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "fb051475862b2af61d6d999bfededf822dfcc4093ad6fa4e3d98aa39b7ccabaf"
    sha256 cellar: :any_skip_relocation, sequoia:      "79d5a5b4597535f5ecded9140eaf931abfa27e133c0ad5df93c5dad6002c83e9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2a49df54b93116fcfb4010eb93b05731c7e4396950effd0940df313b77d140ec"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5e030726bc5a64fcb072cb1036e21130c7fd0391c464cc0d1fa41dad0c3eea74" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "226a8168e7823eb402120c327787a75f9dd84b166dc2870c963dfb2cbe735f59" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5fd2d09645a5b9e2a0df8f39ac9c131a84f8f2a4000d2f3fde244ee8ae87b536" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1543+6db520a4c.tar.xz"
  version "0.17.0-dev.1543+6db520a4c"
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
