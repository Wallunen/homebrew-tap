class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260515-101638"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "dfe0c40766f8cc110335c82a5a64b56c33d4de42772beb566519666d85224086"
    sha256 cellar: :any_skip_relocation, sequoia:      "ad90fb37c7cae1e68e924a6e7aacfad01f01690519e57c8bbfd3fceeaa734fa6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d13ca2f57222b79b77824a2baa5207c33ecb59d876e520f677ece3343865fdac"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3fcd618bca6dfb96145162832de77240a3f847f8ba18baf32592e03124d8b30b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "95d47d5bdb520544ffcb31cb56831009d7f5b2176546d0ea1411e59946ac10d6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "cc96628030e54ad9ff38df7bb858bd7c05dd522977a7c73e900c730f1d00be75" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.304+9787df942.tar.xz"
  version "0.17.0-dev.304+9787df942"
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
