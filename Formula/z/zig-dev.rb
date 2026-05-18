class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260518-113937"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "6d8e20c644d4ff1b7823698604261014516ad1eb2894781837d34f9b2d1d4ba6"
    sha256 cellar: :any_skip_relocation, sequoia:      "d96e9f727b0d592420fc165cb224ab4e48baa5182ff594d3bd33ce332cf20af4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d4fad8efb79532a074361fb0562d3dd0590423487fdcb406a4ed270a3a875520"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "02700900d2d48f8dee65f00553e4142109e5d8caae47531d68bedb1e4d60cc78" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "842313e4e47f72b601994dcb9114bd88d7be2ad8ecfd37a2d7d882a51045d2cc" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "df39f7482ea8a60d19d973a7b42167c74457fca844cace4953dedb73af7c033a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.305+bdfbf432d.tar.xz"
  version "0.17.0-dev.305+bdfbf432d"
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
