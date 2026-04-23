class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260423-171416"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "6be28cd189a429ba667f4a3ced44635749519c09df62bd63fd467b45c82a65b7"
    sha256 cellar: :any_skip_relocation, sequoia:      "543646659faf170403a63443f25a086ec304721d53312d8ee3a3ad5eebcd90cb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c5a06819703e5456ee8f56748893a94c53f054587b1ab0090512fd5e138b6c51"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c7efaeb0b9ec593121c7c3620d79f0771bc6b0e377c445d37caf27e9f7f5c965" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7957d6f9dc5d5196bb83169601423284a6631b7084730e2214ba862224f47abf" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a3eae1cdb9643cf68e09e97574fb6780699e05148c270e52347faa293b80d858" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.87+9b177a7d2.tar.xz"
  version "0.17.0-dev.87+9b177a7d2"
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
