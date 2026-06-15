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
      sha256 "48eb32c97e11c921c4fd1139bd15c2eb33aeea9af00394768773d0d7d3611071" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "42c4ba40fb6bad4e0927175d47c6d3c60a174de951837f7c1fe03cc9f177df8d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "527752a4e615dd67a2ce733246aec30bd3303b8b959532540963f900c27f94b7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.864+3deb86baf.tar.xz"
  version "0.17.0-dev.864+3deb86baf"
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
