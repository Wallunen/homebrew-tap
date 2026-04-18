class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260418-163314"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c24ac8a852272d72b62b61f53c1e2b38b3b0c960ba93473224f9658f94012d48"
    sha256 cellar: :any_skip_relocation, sequoia:      "d9fce21eae24da1d31240e087ca1b90e9143c86cf1b932268a2eecd9b26be2b7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "943e823aa3b8e2c70aacb4387635755790f6510747b9f8a1879d0e08606ac46c"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "75e827582aeb6f415f4b32560655fda0a55b0f4392c56decd41f97441864ee10" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4ec10b006b26ff420129ed65e9a5d67a0a1c63959d70329a8b294973ab1556b7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c0f91d9439375eb0f71c40f3f17fd6399af06d8bf8e87bd490c29ee906110088" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.27+0dd99c37c.tar.xz"
  version "0.17.0-dev.27+0dd99c37c"
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
