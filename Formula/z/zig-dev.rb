class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260619-120102"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "abc50eea387802cdc3961bc4d00dce23d8d54f960069704a63ef68eba5d8bfaa"
    sha256 cellar: :any_skip_relocation, sequoia:      "5e093bde85415a358eceae64225ee8a51df10d0503812eec39446251dc023e40"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "acadd5a5e84e3196b9d63e71b7d4855f698d14424d3fadde665d851cc53af4a6"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1329d4bcb26b2db0801a535cc798789f37fc05825c1d942e39b584b0dbb504f2" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d49201f9389ef57e8725811149795d998490ff2ffa0b379469fcddc0316728cc" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "07696249a07312c29e8ce6cd74049552fcfb7fc6d679730c4b6c3c3f43948455" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.892+54537285c.tar.xz"
  version "0.17.0-dev.892+54537285c"
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
