class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260816-161651"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "2aebe625a5e4c12b3809e9d699c6a52c97088c8bb53b464f940c027abcba3712"
    sha256 cellar: :any_skip_relocation, sequoia:      "ac79004a49ba660d2752da768c1b4e88f7fbee16b5d3d747e7eb6747179bf3fb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a7e55dde620f65c23c86d7b5e5ef1439fec2f2711de512baa01c0159cf0d762c"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c105c10feeb154f95029fbb8e4df50af5efe395b549a9d9fcbb91be8259322cd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "29c14d683e88b7c06a3a691d1832beedf3ec9f6fac8a2725aa1b52013ba5dcce" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f31f05453e456f46d910ec9b9354c857c38b38b8f151af1e7d6117699c669837" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1770+5d7cf3f34.tar.xz"
  version "0.17.0-dev.1770+5d7cf3f34"
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
