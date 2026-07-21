class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260720-022936"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "48cbbae92c7f37c8632650a485c3628fad6c944a94fd0b4bc4bebeec184575db"
    sha256 cellar: :any_skip_relocation, sequoia:      "dd1839bb02d7607aae849df90a1bc0225c1131424251a0b0f81bad5edfb5a802"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b1f78e8e8100ed1d46b87ae569436f8bc2399b89e4ff133b3da0c3fb9642dd71"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b41f7b7ed076d84cb2f9794316f947017af26b27f5c11d5d5b735942612b4cc4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4351e5c97daa1ae4eba6cf7df4d194b5f64c6d450886134b36b148a1ead70c7d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b9d2b068e4245b3de4b1e3acb43a214e46f366a7cbc77d573edc1425a4403cdd" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1441+d5181a9c9.tar.xz"
  version "0.17.0-dev.1441+d5181a9c9"
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
