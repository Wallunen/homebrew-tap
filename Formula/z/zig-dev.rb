class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260829-002007"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "54bddec16293a56ee098d90bb399a67b7a4165c5c885baeea9cde5e40105ae24"
    sha256 cellar: :any_skip_relocation, sequoia:      "e44d0101ca38f9b808fedb06d5f4396814d5ac1cff0d73cda9bff824117cdeee"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "64198d544f4e119f9f715f059732385b0a171deb4f15ab17749126f6a6682b9c"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "310086ac8b177a32f2b6a2f1b1f742db17a0d346841c57255a47c8b696d8ea44" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "64588edb1a32fdd64e6014d5a21f013a74936e32d7196a1afb48df8d61803419" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "122e91695d3dd7a7b640dac7f901a09a900614ef01e936c9f517dae8299b4368" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1933+e19a73c2d.tar.xz"
  version "0.17.0-dev.1933+e19a73c2d"
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
