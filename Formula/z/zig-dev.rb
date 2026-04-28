class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260428-100820"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1d2181d10984cec101dca31367be8b850718acc9768c2a1d196ede8b76a3094b"
    sha256 cellar: :any_skip_relocation, sequoia:      "afcfb0bfe026fb075ad27ed56c6a1d7665706d73882e01a270d75e5fbed10237"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c0f282504042ec473ca950e4a878bc497bdb461c121a31ab38d08e45aca6e6fd"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f2a386143fc1a30854d14a881debf5e312810f23d84b26e19c5c82909bb57958" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b34f603f291eb25ca80c4d2233106d080ce8d39929cb0299977db614c7a0ac6e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e909c714463eb94386a1d8a965a353c81ff5f25a56a2d962c926c66be745e1bc" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.135+9df02121d.tar.xz"
  version "0.17.0-dev.135+9df02121d"
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
