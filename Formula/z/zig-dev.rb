class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260807-022331"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "98ea8269116ca721e7b57191234d58915d70225ed17f1c814fcbc940409b350a"
    sha256 cellar: :any_skip_relocation, sequoia:      "abb1ca78834e683b6d89137922e6277bb75affcdda0e8ad3a70548c0e587e4a3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e82fc2cc7d8be64b2f4d72672920c1bdca061b0962f539922e6586af4c587b7d"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0f0b745140e55992269052d59425cef63d04341fcf870f696917d5fa73a04caa" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5628b848867b9d4e889526a00001e138b2360f59edbdbee42dd3096065773c77" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "25bcb0cf8e31314b798f2b9318e1ccd13ea8bd21f030c734923f263578b8d520" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1606+a06534d73.tar.xz"
  version "0.17.0-dev.1606+a06534d73"
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
